import { User } from './user.entity';
import { BadRequestException, Injectable, NotFoundException, ForbiddenException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/CreateUser.dto';
import * as bcrypt from 'bcrypt';
import { UpdateUserDto } from './dto/UpdateUser.dto';

@Injectable()
export class UsersService {
    constructor(@InjectRepository(User) private usersRepository: Repository<User>) {}

    async findAll (): Promise<User[]> {
        const returned = await this.usersRepository.find( {relations: ['created', 'worksFor']} );
        return returned;

    }

    async createUser(createUserDto: CreateUserDto) {
        const existingUser = await this.findOne(createUserDto.username, false);
        if(existingUser) {
            throw new BadRequestException('Username already exists', { cause: new Error(), description: 'a user with that username already exists, try a different username.' })
        }
        const newUser = this.usersRepository.create(createUserDto);
        newUser.password = await bcrypt.hash(newUser.password, 10);
        return this.usersRepository.save(newUser);
    }

    async findOne (username: string, withCheck:boolean=false): Promise<User> {
        const user = await this.usersRepository.findOne({ where: { username: username }, relations: ['created', 'reviews']});
        if (!user && withCheck) {
            throw new NotFoundException("User with that username doesn't exist.")
        }
        return user;
    }
    async findOneById(id: number, withCheck:boolean=false) {
        const user = await this.usersRepository.findOne({ where: { id: id }, relations: ['created', 'reviews']});
        if (!user && withCheck) {
            throw new NotFoundException("User with that username doesn't exist.")
        }
        return user;
    }
    
    async remove(id: number, user) {
        if (id != user.userId) {
            throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'User can not delete other users, only themselves' })
            
        }
        await this.usersRepository.delete(id)
        return {};
    }
    async changePassword(updateUserDto: UpdateUserDto, user){
        let userToBeUpdated = await this.findOneById(user.userId);
        const isPassword = await bcrypt.compare(updateUserDto.oldPassword, userToBeUpdated.password);
        if(!isPassword) {
            throw new ForbiddenException("Invalid Old password");
            
        }
        if (updateUserDto.newUsername){
            userToBeUpdated.username = updateUserDto.newUsername; 
        }
        if (updateUserDto.newPassword){
            userToBeUpdated.password = await bcrypt.hash(updateUserDto.newPassword, 10);

        }
        await this.usersRepository.save(userToBeUpdated);
    }


}


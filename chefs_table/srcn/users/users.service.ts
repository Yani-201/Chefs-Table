import { Movie } from './../movies/movie.entity';
import { User } from './user.entity';
import { BadRequestException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/CreateUser.dto';

@Injectable()
export class UsersService {
    constructor(@InjectRepository(User) private usersRepository: Repository<User>) {}

    findAll (): Promise<User[]> {
        return this.usersRepository.find( {relations: ['created']} )

    }

    async createUser(createUserDto: CreateUserDto) {
        const existingUser = await this.findOne(createUserDto.username );
        if(existingUser) {
            throw new BadRequestException('Username already exists', { cause: new Error(), description: 'a user with that username already exists, try a different username.' })
        }
        const newUser = this.usersRepository.create(createUserDto);
        return this.usersRepository.save(newUser);
    }

    async findOne (username: string): Promise<User> {
        return this.usersRepository.findOne({ where: { username: username }, relations: ['created', 'reviews']});
    }
    
    async remove(id: number): Promise<void> {
        await this.usersRepository.delete(id);
    }


}


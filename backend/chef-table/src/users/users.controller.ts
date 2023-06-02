import { JwtAuthGuard } from './../auth/jwt-auth.guard';
import { Controller, Get, Param, Delete, Post, Body, UsePipes, ValidationPipe, UseGuards, ParseIntPipe, Request, Patch, UploadedFile, UseInterceptors } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/CreateUser.dto';
import { UpdateUserDto } from './dto/UpdateUser.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { v4 as uuidv4 } from 'uuid';
import * as path from 'path'


export const storage = {
	storage: diskStorage({
		destination: './profilePhotos',
		filename: (req, file, cb) => {
			const filename: string = path.parse(file.originalname).name.replace(/\s/g, '') + uuidv4();
			const extension: string = path.parse(file.originalname).ext;
			cb(null, `${filename}${extension}`)
		}
	})
}

@Controller('users')
export class UsersController {
    constructor(private readonly userService: UsersService){}
    @Get()
    getAllUsers () {
        return this.userService.findAll()
    }

    @Get(':id')
    getUser(@Param('id') id:number) {
        return this.userService.findOneById(+id, true);
    }

    @Delete(":id")
    @UseGuards(JwtAuthGuard)
    removeUser(@Param('id', ParseIntPipe) id: number, @Request() req) {
        return this.userService.remove(id, req.user);
    }

    @Post()
    @UsePipes(ValidationPipe)
	@UseInterceptors(FileInterceptor('photo', storage))
    createUser(@Body() createUserDto: CreateUserDto, @UploadedFile() file: Express.Multer.File) {
        console.log(createUserDto);
        return this.userService.createUser(createUserDto, file?.path);
    }

    @UseGuards(JwtAuthGuard)
    @UsePipes(ValidationPipe)
    @Patch()
	@UseInterceptors(FileInterceptor('photo', storage))
    changePassword(@Body() updateUserDto:UpdateUserDto, @Request() req, @UploadedFile() file: Express.Multer.File){
        return this.userService.changePassword(updateUserDto, req.user, file?.path);
    }
}


import { JwtAuthGuard } from './../auth/jwt-auth.guard';
import { Controller, Get, Param, Delete, Post, Body, UsePipes, ValidationPipe, UseGuards, ParseIntPipe, Request, Patch } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/CreateUser.dto';
import { UpdateUserDto } from './dto/UpdateUser.dto';

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
    createUser(@Body() createUserDto: CreateUserDto) {
        console.log(createUserDto);
        return this.userService.createUser(createUserDto);
    }

    @UseGuards(JwtAuthGuard)
    @UsePipes(ValidationPipe)
    @Patch()
    changePassword(@Body() updateUserDto:UpdateUserDto, @Request() req){
        return this.userService.changePassword(updateUserDto, req.user);
    }
}


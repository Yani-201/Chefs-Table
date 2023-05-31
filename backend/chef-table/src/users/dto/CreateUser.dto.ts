import { IsNotEmpty, MinLength , IsEmail, IsAlphanumeric, IsEnum, IsArray } from "class-validator";
import { Role } from "../roles/roles.enum";
import { Type } from "class-transformer";

export class CreateUserDto {
    @IsNotEmpty()
    @MinLength(3)
    @IsAlphanumeric()
    username: string;
    
    @IsNotEmpty()
    @MinLength(4)
    password: string;

    @IsNotEmpty()
    @IsEmail()
    email: string;

    @IsNotEmpty()
    @IsArray()
    @IsEnum(Role, {each: true})
    roles: Role[];
}
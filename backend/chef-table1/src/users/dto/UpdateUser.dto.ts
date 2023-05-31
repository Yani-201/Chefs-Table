import { IsNotEmpty, IsOptional, MinLength } from "class-validator";
import { Role } from "../roles/roles.enum";

export class UpdateUserDto {
    @IsNotEmpty()
    @MinLength(4)
    oldPassword: string;
    
    @IsOptional()
    @IsNotEmpty()
    newUsername: string;
    
    @IsOptional()
    @IsNotEmpty()
    @MinLength(4)
    newPassword: string;

    @IsOptional()
    newRoles: Role[]
}
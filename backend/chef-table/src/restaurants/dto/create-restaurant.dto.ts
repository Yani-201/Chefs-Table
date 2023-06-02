
import {IsNotEmpty, IsOptional, IsPhoneNumber, IsString} from "class-validator";

export class CreateRestaurantDto {

    @IsNotEmpty()
    @IsString()
    name: string;

    @IsNotEmpty()
    @IsString()
    location: string;

    @IsOptional()
    menu: string;
    
    @IsNotEmpty()
    @IsPhoneNumber('ET')
    phone: string;


}
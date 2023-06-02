
import { IsNotEmpty, IsOptional, IsPhoneNumber, IsString } from "class-validator";

export class UpdateRestaurantDto {

    @IsOptional()
    @IsString()
    name: string;

    @IsOptional()
    menu: string;

    @IsOptional()
    @IsString()
    location: string;
    
    @IsOptional()
    @IsPhoneNumber('ET')
    phone: string;

}
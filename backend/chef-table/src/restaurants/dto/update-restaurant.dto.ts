
import { IsNotEmpty, IsOptional, IsPhoneNumber, IsString } from "class-validator";

export class UpdateRestaurantDto {

    @IsOptional()
    @IsNotEmpty()
    @IsString()
    name: string;

    @IsOptional()
    @IsNotEmpty()
    @IsString()
    location: string;
    
    @IsOptional()
    @IsPhoneNumber('ET')
    phone: string;

}
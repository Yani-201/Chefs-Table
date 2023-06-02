import { Type } from "class-transformer";
import { MinLength , IsOptional, IsNotEmpty, IsNumberString, IsNumber, IsInt } from "class-validator";

export class UpdateRecipeDto {
    @IsOptional()
    title: string;

    @IsOptional()
    ingredients: string[];

    @IsOptional()
    @Type(() => Number)
    @IsInt()
    time: number;

    @IsOptional()
    @MinLength(10)
    procedure: string;
    
    @IsOptional()
    photo: string;


}
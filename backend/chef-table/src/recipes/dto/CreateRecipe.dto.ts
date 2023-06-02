import { Type } from "class-transformer";
import { IsNotEmpty, MinLength , IsOptional, IsInt } from "class-validator";

export class CreateRecipeDto {
    @IsNotEmpty()
    title: string;

    @IsNotEmpty()
    // @MinLength(1)
    ingredients: string[];

    @IsNotEmpty()
    @MinLength(10)
    procedure: string;

    @IsNotEmpty()
    @Type(() => Number)
    @IsInt()
    time: number;

    @IsOptional()
    photo?: string;

}
import { IsNotEmpty, MinLength , IsOptional } from "class-validator";

export class CreateRecipeDto {
    @IsNotEmpty()
    title: string;

    @IsNotEmpty()
    // @MinLength(1)
    ingredients: string[];

    @IsNotEmpty()
    @MinLength(10)
    procedure: string;

    @IsOptional()
    photo: string;

}
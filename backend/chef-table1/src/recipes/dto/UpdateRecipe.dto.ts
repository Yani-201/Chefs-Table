import { MinLength , IsOptional, IsNotEmpty } from "class-validator";

export class UpdateRecipeDto {
    @IsOptional()
    @IsNotEmpty()
    title: string;

    @IsOptional()
    @IsNotEmpty()
    @MinLength(1)
    ingredients: string[];

    @IsOptional()
    @IsNotEmpty()
    @MinLength(10)
    procedure: string;
    
    @IsOptional()
    photo: string;


}
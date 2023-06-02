import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { UpdateRecipeDto } from './dto/UpdateRecipe.dto';
import { CreateRecipeDto } from './dto/CreateRecipe.dto';
import { Body, Controller, Get, Post, UsePipes, ValidationPipe, Delete, ParseIntPipe, UseGuards, Request, UseInterceptors, ClassSerializerInterceptor, UploadedFile } from '@nestjs/common';
import { RecipesService } from './recipe.service';
import { Param, Patch } from '@nestjs/common/decorators';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { v4 as uuidv4 } from 'uuid';
import * as path from 'path'
import { Roles } from 'src/users/roles/roles.decorator';
import { Role } from 'src/users/roles/roles.enum';
import { RolesGuard } from 'src/users/roles/roles.guard';

export const storage = {
	storage: diskStorage({
		destination: './covers',
		filename: (req, file, cb) => {
			const filename: string = path.parse(file.originalname).name.replace(/\s/g, '') + uuidv4();
			const extension: string = path.parse(file.originalname).ext;
			cb(null, `${filename}${extension}`)
		}
	})
}

@Controller('recipes')
export class RecipesController {
	constructor(private readonly recipesService: RecipesService) {}
	@Get()
	getAllRecipes() {
		return this.recipesService.findAll(); 
  	}

	@Get(':id')
	@UseInterceptors(ClassSerializerInterceptor)
	getRecipe(@Param('id', ParseIntPipe) id) {
		return this.recipesService.findById(id);
	}

	// @Get('cover/:imageName')
	// getRecipeCover(@Param('imageName') imageName:string, @Res() res) {
	// 	return res.sendFile(path.join(process.cwd(), 'covers/' + imageName))
	// }

	@Get(':id/reviews')
	@UseInterceptors(ClassSerializerInterceptor)
	getReviewsForRecipe(@Param('id', ParseIntPipe) id) {
		return this.recipesService.findReviews(id);
	}

	@UseGuards(JwtAuthGuard)
    @Roles(Role.Chef)
    @UseGuards(JwtAuthGuard, RolesGuard)
    @UsePipes(ValidationPipe)
	@Post() 
	@UseInterceptors(FileInterceptor('photo', storage))
	createRecipe(@Body() createRecipeDto: CreateRecipeDto, @Request() req, @UploadedFile() file: Express.Multer.File) {
		console.log(createRecipeDto);
		return this.recipesService.createRecipe(createRecipeDto, req.user, file?.path);
	}

	@UseGuards(JwtAuthGuard)
    @Roles(Role.Chef)
    @UseGuards(JwtAuthGuard, RolesGuard)
    @UsePipes(ValidationPipe)
	@Delete(":id")
	removeRecipe(@Param('id', ParseIntPipe) id:number, @Request() req) {
		console.log('here');
		return this.recipesService.remove(id, req.user);
	}

	@UseGuards(JwtAuthGuard)
    @Roles(Role.Chef)
    @UseGuards(JwtAuthGuard, RolesGuard)
    @UsePipes(ValidationPipe)
	@Patch(':id')
	@UseInterceptors(FileInterceptor('photo', storage))
	updateRecipe(@Param('id', ParseIntPipe) id: number, @Body() updateRecipeDto: UpdateRecipeDto, @Request() req, @UploadedFile() file: Express.Multer.File) {
		return this.recipesService.updateRecipe(id, updateRecipeDto, req.user, file?.path);
	}

	

}

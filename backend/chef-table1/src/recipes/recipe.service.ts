import { Review } from '../reviews/review.entity';
import { UsersService } from '../users/users.service';
import { User } from '../users/user.entity';
import { UpdateRecipeDto } from './dto/UpdateRecipe.dto';
import { CreateRecipeDto } from './dto/CreateRecipe.dto';
import { Recipe } from './recipe.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable, BadRequestException, NotFoundException, ForbiddenException } from '@nestjs/common';
import { Repository } from 'typeorm';

@Injectable()
export class RecipesService {
    constructor(@InjectRepository(Recipe) private recipesRepository: Repository<Recipe>, private readonly userService: UsersService) {}

    findAll (): Promise<Recipe[]> {
        return this.recipesRepository.find();
    }

    findOne(title: string): Promise<Recipe> {
        return this.recipesRepository.findOneBy({ title })
    }

    async createRecipe(createRecipeDto: CreateRecipeDto, user: User, image?: string) {
        const existingRecipe = await this.findOne(createRecipeDto.title);
        if (existingRecipe) {
            throw new BadRequestException('Recipe already exists', { cause: new Error(), description: 'That recipe already exists, please search for it to add a review.' })
        }
        const newRecipe = this.recipesRepository.create(createRecipeDto);
        // const trailerLink = newRecipe.trailer; 
        // if (trailerLink) {
        //     newRecipe.trailer = `https://www.youtube.com/embed${trailerLink.slice(trailerLink.lastIndexOf('/'))}`
        // }
        newRecipe.createdBy = await this.userService.findOne(user.username);
        if(image){
            newRecipe.photo = image;

        }
        return this.recipesRepository.save(newRecipe);
    }

    async remove(id: number, user: {userId: number, username: string}) {
        const recipe = await this.findById(id);
        if (recipe.createdBy.id !== user.userId) {
            throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Recipes can only be deleted by the users that created them.' })
        }
        await this.recipesRepository.delete(id);
        
    }

    async updateRecipe(id: number, updateRecipeDto: UpdateRecipeDto, user, image?:string) {
        const recipe = await this.findById(id);
        if (recipe.createdBy.id !== user.userId) {
            throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Recipes can only be updated by the users that created them.' })
        }
        if (image){
            updateRecipeDto.photo = image;

        }

        const updatedRecipe = this.recipesRepository.merge(recipe, updateRecipeDto);
        return await this.recipesRepository.save(updatedRecipe);
         
    }

    async findById(id: number): Promise<Recipe> {
        const recipe = await this.recipesRepository.findOne({ where: { id }, relations: ['createdBy']});
        if (!recipe) {
            throw new NotFoundException("Recipe doesn't exist.");
        }
        return recipe;
    }

    async findReviews(id: number): Promise<Review[]> {
        const recipe = await this.recipesRepository.findOne({ where: { id }, relations: ['reviews']});
        if (recipe){
            const { reviews } = recipe;
            return reviews;
        }
        throw new NotFoundException("Recipe doesn't exist.");;
    }

    async recalculateRecipe(id: number) {
        const reviewsForRecipe = await this.findReviews(id);
        let averageRating = 0;
        for (const review of reviewsForRecipe) {
            averageRating += review.rating;
        }
        averageRating /= reviewsForRecipe.length;
        this.recipesRepository.update({ id }, {rating: averageRating})
    }
}

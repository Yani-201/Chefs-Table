import { UpdateReviewDto } from './dto/UpdateReview.dto';
import { UsersService } from './../users/users.service';
import { RecipesService } from '../recipes/recipe.service';
import { CreateReviewDto } from './dto/CreateReview.dto';
import { Injectable, ForbiddenException, NotFoundException, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Review } from './review.entity';

@Injectable()
export class ReviewsService {
    constructor(@InjectRepository(Review) private reviewRepository: Repository<Review>, private readonly recipesService: RecipesService, private readonly userService: UsersService) {}
    async findReview(id: number, recipe=false): Promise<Review> {
        let review: Review;
        if (recipe) {
            review = await this.reviewRepository.findOne({ where: { id }, relations: ['reviewer', 'recipe']});
            
        } else {
            review = await this.reviewRepository.findOne({ where: { id }, relations: ['reviewer']});
            
        }
        
        if (!review) {
            throw new NotFoundException("Review with that Id doesn't exist")
        }
        return review
    }

    findAll(): Promise<Review[]> {
        return this.reviewRepository.find();
 
    }

    async create(createReviewDto: CreateReviewDto, user: { userId: number, username: string}) {
        // recieve recipeId, check if existence in recipeDB
        // save to reviewRepo
        const recipe = await this.recipesService.findById(createReviewDto.recipeId);
        const newReview = this.reviewRepository.create(createReviewDto);
        newReview.recipe = recipe;
        const reviewer = await this.userService.findOne(user.username);
        if(!reviewer || !recipe){
            throw new BadRequestException("Invalid reviewer or recipe!");
        }
        newReview.reviewer = reviewer;
        const returned = await this.reviewRepository.save(newReview)
        this.recalcuateRatingForRecipe(newReview.recipe.id);
        return returned;
    }
    
    async edit(id: number, updatedReviewDto: UpdateReviewDto, user: {userId: number, username: string}) {
        const review = await this.findReview(id, true);
        if (review.reviewer.id !== user.userId) {
            throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Reviews can only be updated by the users that created them.' })
            
        }
        const updatedReview = this.reviewRepository.merge(review, updatedReviewDto);
        await this.reviewRepository.save(updatedReview);
        this.recalcuateRatingForRecipe(review.recipe.id);
        
    }
    async delete(id: number, user: {userId: number, username: string}) {
        const review = await this.findReview(id, true);
        
        if (review.reviewer.id !== user.userId) {
            throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Reviews can only be deleted by the users that created them.' })
        }
        await this.reviewRepository.delete(id);
        this.recalcuateRatingForRecipe(review.recipe.id);
    }
    recalcuateRatingForRecipe(recipeId: number) {
        this.recipesService.recalculateRecipe(recipeId);
    }
}

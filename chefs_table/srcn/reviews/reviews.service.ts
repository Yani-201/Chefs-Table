import { MoviesService } from './../movies/movies.service';
import { CreateReviewDto } from './dto/CreateReview.dto';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Review } from './review.entity';

@Injectable()
export class ReviewsService {
    constructor(@InjectRepository(Review) private reviewRepository: Repository<Review>, private readonly movieService:MoviesService) {}
    findReview(id: number): Promise<Review> {
        return this.reviewRepository.findOneBy({ id });
    }

    findAll(): Promise<Review[]> {
        return this.reviewRepository.find();
 
    }

    create(createReviewDto: CreateReviewDto, user: { userId: number, username: string}) {
        // recieve movieId, check if existence in movieDB
        // save to reviewRepo
        const movie = this.movieService.findById(createReviewDto.movieId);
        console.log(movie)
    }
    edit() {}
    delete() {}
}

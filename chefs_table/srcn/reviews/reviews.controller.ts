import { CreateReviewDto } from './dto/CreateReview.dto';
import { Body, Controller, Get, Param, ParseIntPipe, Post, Request } from '@nestjs/common';
import { ReviewsService } from './reviews.service';

@Controller('reviews')
export class ReviewsController {
  constructor(private readonly reviewsService: ReviewsService) {}
    
    @Get()
    getAllReviews() {
      return this.reviewsService.findAll();
    }

    @Get(':id')
    getReview(@Param('id', ParseIntPipe) id) {
        this.reviewsService.findReview(id);
    }

    @Post('create')
    createReview(@Body() createReviewDto: CreateReviewDto, @Request() req) {
      return this.reviewsService.create(createReviewDto, req.user)
    }
    

}


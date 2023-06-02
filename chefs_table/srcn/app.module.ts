import { Review } from './reviews/review.entity';
import { Movie } from './movies/movie.entity';
import { User } from './users/user.entity';
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { MoviesModule } from './movies/movies.module';
import { ReviewsModule } from './reviews/reviews.module';

@Module({
  imports: [TypeOrmModule.forRoot({
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: 'Toshigamer21',
    database:'moviereview',
    entities: [User, Movie, Review],
    synchronize: true,
  }), UsersModule, AuthModule, MoviesModule, ReviewsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

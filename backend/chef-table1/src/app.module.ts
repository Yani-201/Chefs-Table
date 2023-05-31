import { ReviewsModule } from './reviews/reviews.module';
import { Review } from './reviews/review.entity';
import { Recipe } from './recipes/recipe.entity';
import { RecipesModule } from './recipes/recipe.module';
import { User } from './users/user.entity';
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { RestaurantsModule } from './restaurants/restaurants.module';
import { Restaurant } from './restaurants/entities/restaurant.entity';
import { APP_GUARD } from '@nestjs/core';
import { RolesGuard } from './users/roles/roles.guard';
import { JWTModule } from './auth/JWT.module';

@Module({
  imports: [ConfigModule.forRoot(), TypeOrmModule.forRoot({
    type: 'mysql',
    host: '127.0.0.1',
    port: 3306,
    username: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: 'cheftable',
    entities: [User, Recipe, Review, Restaurant],
    synchronize: true,
  }), UsersModule, AuthModule, RecipesModule, ReviewsModule, RestaurantsModule, JWTModule],
  controllers: [AppController],
  providers: [AppService],
})

export class AppModule {}

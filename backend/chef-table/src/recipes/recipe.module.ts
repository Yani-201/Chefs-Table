import { UsersModule } from '../users/users.module';
import { Recipe } from './recipe.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { RecipesService } from './recipe.service';
import { RecipesController } from './recipe.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Recipe]), UsersModule],
  controllers: [RecipesController],
  providers: [RecipesService],
  exports: [RecipesService],
})

export class RecipesModule {}

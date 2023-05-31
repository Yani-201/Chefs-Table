import { Recipe } from 'src/recipes/recipe.entity';
import { User } from './../users/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';

@Entity()
export class Review {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  rating: number;

  @Column("longtext")
  review: string;

  @ManyToOne(() => Recipe, (recipe) => recipe.reviews, { onDelete: "CASCADE" })
  recipe: Recipe;

  @ManyToOne(() => User, (user) => user.reviews, { onDelete: "CASCADE" })
  reviewer: User;
}
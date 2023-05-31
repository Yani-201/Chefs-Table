import { Recipe } from 'src/recipes/recipe.entity';
import { Review } from './../reviews/review.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, OneToOne, ManyToOne, JoinColumn } from 'typeorm';
import { Exclude } from 'class-transformer';
import { Restaurant } from 'src/restaurants/entities/restaurant.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({unique: true})
  username: string;

  @Column()
  email: string;

  @Column()
  @Exclude()
  password: string;

  @Column('simple-array')
  roles: string[];
  
  @Column({ default: ""})
  photo: string; 

  @OneToMany(() => Review, (review) => review.reviewer)
  reviews: Review[];

  @OneToMany(() => Recipe, (recipe) => recipe.createdBy, {cascade: true})
  created: Recipe[];

  @OneToOne(() => Restaurant, (restaurant) => restaurant.chefs, {cascade: true, onDelete: 'SET NULL'})
  @JoinColumn()
  worksFor: Restaurant;
  
  @ManyToOne(() => Restaurant, (restaurant) => restaurant.likes, { onDelete: "SET NULL" })
  likedRestaurants: Restaurant;
}
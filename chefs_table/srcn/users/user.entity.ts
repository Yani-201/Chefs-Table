import { Movie } from './../movies/movie.entity';
import { Review } from './../reviews/review.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({unique: true})
  username: string;

  @Column()
  email: string;

  @Column()
  password: string;

  @OneToMany(() => Review, (review) => review.user)
  reviews: Review[];

  @OneToMany(() => Movie, (movie) => movie.createdBy, {cascade: true})
  created: Movie[];

}
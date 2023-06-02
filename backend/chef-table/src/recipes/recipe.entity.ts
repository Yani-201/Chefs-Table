import { Review } from '../reviews/review.entity';
import { User } from '../users/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, OneToMany } from 'typeorm';

@Entity()
export class Recipe{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    title: string;

    @Column("simple-array")
    ingredients: string[];

    @Column("longtext")
    procedure: string;

    @Column()
    time: number;

    @Column({ default: "", nullable: true})
    photo: string; 
    
    @Column('int', { default: 0})
    rating: number;

    @ManyToOne(() => User, (user) => user.created, { onDelete: 'CASCADE' })
    @JoinColumn({name: 'userId', referencedColumnName: "id"})
    createdBy: User;

    @OneToMany(() => Review, (review) => review.recipe, {cascade: true})
    reviews: Review[];

}
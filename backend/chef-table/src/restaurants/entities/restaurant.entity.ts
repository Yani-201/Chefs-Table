import { User } from 'src/users/user.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToOne, OneToMany } from 'typeorm';

@Entity()
export class Restaurant {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    location: string;

    @Column()
    phone: string;
    
    @Column({ default: ""})
    photo: string; 

    @OneToMany(()=>User, (user) => user.likedRestaurants)
    likes: User[];

    @OneToOne(() => User, (user) => user.worksFor)
    chefs: User;

}

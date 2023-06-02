import { BadRequestException, ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { CreateRestaurantDto } from './dto/create-restaurant.dto';
import { UpdateRestaurantDto } from './dto/update-restaurant.dto';
import { Restaurant } from './entities/restaurant.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class RestaurantsService {
  constructor(@InjectRepository(Restaurant) private restaurantRepository: Repository<Restaurant>, private readonly userService: UsersService) {}

  async create(createRestaurantDto: CreateRestaurantDto, user, image?: string) {
    // const existing = await this.findByName(createRestaurantDto.name);
    // if (existing) {
    //   throw new BadRequestException('Restaurant already exists')

    // }
    const headChef = await this.userService.findOne(user.username);
    if (headChef.worksFor){
      throw new BadRequestException("Chef already works for another restaurant.")
    }
    createRestaurantDto.menu = JSON.stringify(createRestaurantDto.menu)
    const restaurant = await this.restaurantRepository.create(createRestaurantDto);
    
    restaurant.chefs= headChef;
    if (image){
      restaurant.photo = image;

    }

    return await this.restaurantRepository.save(restaurant);
  }

  findAll() {
    return this.restaurantRepository.find({relations: ['likes', 'chefs']});
  }

  async findOne(id: number, withChefs=false): Promise<Restaurant> {
    let restaurant;
    if (withChefs) {
      restaurant = await this.restaurantRepository.findOne({ where: {id}, relations: ['chefs'] });
      
    } else {
      restaurant = await this.restaurantRepository.findOneBy({id});
            
    }

    if (!restaurant) {
      throw new NotFoundException("Restaurant with that ID doesn't exist! ");
    }
    return restaurant;
  
  }
  findByName(name: string) {
    return this.restaurantRepository.findOne({ where: { name: name }, relations: ['chefs']});

  }
  async update(id: number, updateRestaurantDto: UpdateRestaurantDto, chef, image?:string ) {
    const oldRestaurant = await this.findOne(id, true);
    if (oldRestaurant.chefs.id != chef.userId) {
        throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Restaurants can only be updated by the chefs that created them.' })
        
    }

    updateRestaurantDto.menu = JSON.stringify(updateRestaurantDto.menu);
    if (updateRestaurantDto.location) {
      oldRestaurant.location = updateRestaurantDto.location;
    }
    if (updateRestaurantDto.menu) {
      oldRestaurant.menu = updateRestaurantDto.menu;
    }if (updateRestaurantDto.phone) {
      oldRestaurant.phone = updateRestaurantDto.phone;
    }if (updateRestaurantDto.name) {
      oldRestaurant.name = updateRestaurantDto.name;
    }
    if (image){
      oldRestaurant.photo = image;

    }
    return await this.restaurantRepository.save(oldRestaurant);
  }
  
  async remove(id: number, chef) {
    const oldRestaurant = await this.findOne(id, true);
    if (oldRestaurant.chefs.id != chef.userId) {
        throw new ForbiddenException("Action Forbidden.", { cause: new Error(), description: 'Restaurants can only be updated by the chefs that created them.' })
        
    }
    return await this.restaurantRepository.delete(id);
  
  }
}

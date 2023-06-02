import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe, UseInterceptors, ClassSerializerInterceptor, UseGuards, UsePipes, ValidationPipe, Request, UploadedFile } from '@nestjs/common';
import { RestaurantsService } from './restaurants.service';
import { CreateRestaurantDto } from './dto/create-restaurant.dto';
import { UpdateRestaurantDto } from './dto/update-restaurant.dto';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { Roles } from 'src/users/roles/roles.decorator';
import { Role } from 'src/users/roles/roles.enum';
import { RolesGuard } from 'src/users/roles/roles.guard';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { v4 as uuidv4 } from 'uuid';
import * as path from 'path'

export const storage = {
	storage: diskStorage({
		destination: './restaurantCovers',
		filename: (req, file, cb) => {
			const filename: string = path.parse(file.originalname).name.replace(/\s/g, '') + uuidv4();
			const extension: string = path.parse(file.originalname).ext;
			cb(null, `${filename}${extension}`)
		}
	})
}

@Controller('restaurants')
export class RestaurantsController {
  constructor(private readonly restaurantsService: RestaurantsService) {}

  @UseGuards(JwtAuthGuard)
  @Roles(Role.Chef)
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UsePipes(ValidationPipe)
  @Post()
	@UseInterceptors(FileInterceptor('photo', storage))
  create(@Body() createRestaurantDto: CreateRestaurantDto, @Request() req, @UploadedFile() file: Express.Multer.File) {
    console.log(createRestaurantDto);
    return this.restaurantsService.create(createRestaurantDto, req.user, file?.path);
  }

  @Get()
  async findAll() {
    return await this.restaurantsService.findAll();
  }

  @Get('search/:name')
  async search(@Param('name') name) {
    return await this.restaurantsService.findByName(name);
  }
  
  @Get(':id')
	@UseInterceptors(ClassSerializerInterceptor)
  async findOne(@Param('id') id) {
    return await this.restaurantsService.findOne(+id, true);
  }
  

  @UseGuards(JwtAuthGuard)
  @Roles(Role.Chef)
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UsePipes(ValidationPipe)
  @Patch(':id')
	@UseInterceptors(FileInterceptor('photo', storage))
  update(@Param('id', ParseIntPipe) id, @Body() updateRestaurantDto: UpdateRestaurantDto, @Request() req, @UploadedFile() file: Express.Multer.File) {
    return this.restaurantsService.update(id, updateRestaurantDto, req.user, file?.path);
  }
  
  @UseGuards(JwtAuthGuard)
  @Roles(Role.Chef)
  @UseGuards(JwtAuthGuard, RolesGuard)
  @UsePipes(ValidationPipe)
  @Delete(':id')
  remove(@Param('id', ParseIntPipe) id, @Request() req) {
    return this.restaurantsService.remove(id, req.user);
  }
}

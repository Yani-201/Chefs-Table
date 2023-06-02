import { AuthService } from './auth/auth.service';
import { Controller, Get, UseGuards, Request, Post, HttpCode, Header } from '@nestjs/common';
import { AppService } from './app.service';
import { LocalAuthGuard } from './auth/local-auth.guard';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService, private authService: AuthService) {}

  @Get()
  getFront() {}

  @UseGuards(LocalAuthGuard)  // for checking if user is in database
  @Post('login')
  @HttpCode(200)
  @Header('Content-Type', 'application/json')
  async login(@Request() req) {
    return this.authService.login(req.user);
  }

}

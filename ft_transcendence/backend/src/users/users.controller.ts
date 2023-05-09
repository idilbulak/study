import { Controller, Post, Body, HttpException, HttpStatus } from '@nestjs/common';
import { UsersService } from './users.service';
import { User } from './users.entity';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/signup')
  async signup(@Body() user: User) {
    const result = await this.usersService.signup(user.username, user.password);
    if (result === 'username_exists') {
      throw new HttpException('Username already exists', HttpStatus.BAD_REQUEST);
    } else {
      return result;
    }
  }
}

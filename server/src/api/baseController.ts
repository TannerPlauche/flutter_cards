import {Body, Controller, Get, Param, Post, Put} from '@nestjs/common';
import {BaseService} from "./baseService";

// @Controller('phoneme')
export class BaseController<T> {

    constructor(private dataService: BaseService<T>) {
    }

    @Get()
    getAll(): Promise<T[]> {
        return this.dataService.getAll();
    }

    @Post()
    async create(@Body() data: T): Promise<T> {
        return this.dataService.create(data);
    }
}

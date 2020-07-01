import {Body, Controller, Get, Param, Post, Put} from '@nestjs/common';
import {BaseService} from "./baseService";

// @Controller('phoneme')
export class BaseController<T> {

    constructor(private dataService: BaseService<T>) {
    }

    @Get()
    getAll(): Promise<T[]> {
        return this.dataService.getAll()
            .then(results => {
                console.log(results);
                return results;
            });
    }

    @Get(':id')
    async getById(@Param() params) {
        const id = params.id;
        return this.dataService.getById(id);
    }

    @Post()
    async create(@Body() data: T): Promise<T> {
        return this.dataService.create(data);
    }

    @Put(':id')
    async updateById(@Param() params, @Body() data: T): Promise<T> {
        const id = params.id;
        return this.dataService.updateById(id, data);
    }
}

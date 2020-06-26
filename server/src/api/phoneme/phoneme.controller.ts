import {Body, Controller, Get, Param, Post, Put} from '@nestjs/common';
import {PhonemeService} from "./phoneme.service";
import {Phoneme} from "../../models/phoneme.model";

@Controller('phoneme')
export class PhonemeController {

    constructor(private phonemeService: PhonemeService) {
    }

    @Get()
    getPhoneme(): Promise<Phoneme[]> {
        return this.phonemeService.getPhonemes();
    }

    @Get(':clownshoes')
    getPhonemeBySymbol(@Param() params): Promise<Phoneme> {
        // queryParams
        // routeParams
        const symbol = params.clownshoes;
        console.log(symbol);

        return this.phonemeService.getPhonemeBySymbol(symbol);
    }

    @Put(':symbol')
    updatePhoneme(@Param() params, @Body() phoneme: Phoneme){
        const symbol = params.symbol;
        return this.phonemeService.updateSymbol(phoneme);
    }

    @Post()
    async createPhoneme(@Body() phoneme: Phoneme): Promise<Phoneme> {
        return this.phonemeService.createPhoneme(phoneme);
    }
}

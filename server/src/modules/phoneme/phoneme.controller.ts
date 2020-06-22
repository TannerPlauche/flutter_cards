import {Body, Controller, Get, Param, Post} from '@nestjs/common';
import {PhonemeService} from "./phoneme.service";
import {Phoneme} from "../../models/phoneme.model";

@Controller('phoneme')
export class PhonemeController {

    constructor(private phonemeService: PhonemeService) {
    }

    @Get()
    getPhoneme(): string {
        return this.phonemeService.getPhonemes();
    }

    @Get(':symbol')
    getPhonemeBySymbol(@Param() params): Promise<Phoneme> {
        const symbol = params.symbol;
        return this.phonemeService.getPhonemeBySymbol(symbol);
    }

    @Post()
    async createPhoneme(@Body() phoneme: Phoneme): Promise<Phoneme> {
        return this.phonemeService.createPhoneme(phoneme);
    }
}

import {Body, Controller, Get, Param, Post, Put} from '@nestjs/common';
import {PhonemeService} from "./phoneme.service";
import {Phoneme} from "../../models/phoneme.model";
import {BaseController} from "../baseController";

@Controller('phoneme')
export class PhonemeController extends BaseController<Phoneme> {

    constructor(private phonemeService: PhonemeService) {
        super(phonemeService)
    }

    @Get(':symbol')
    getPhonemeBySymbol(@Param() params): Promise<Phoneme> {
        const symbol = params.symbol;
        console.log(symbol);

        return this.phonemeService.getPhonemeBySymbol(symbol);
    }

    @Put(':symbol')
    updatePhoneme(@Param() params, @Body() phoneme: Phoneme) {
        const symbol = params.symbol;
        return this.phonemeService.updateSymbol(phoneme);
    }

}

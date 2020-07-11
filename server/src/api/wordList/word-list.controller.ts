import {Controller, Get, Param} from '@nestjs/common';
import {BaseController} from "../baseController";
import {WordList} from "../../models/wordList.model";
import {WordListService} from "./wordList.service";

@Controller('wordlist')
export class WordListController extends BaseController<WordList> {

    constructor(private wordListService: WordListService) {
        super(wordListService);

    }

    @Get('symbol/:symbol/location/:location')
    async getBySymbolAndLocation(@Param() params) {
        const symbol = params.symbol;
        const location = params.location;

        return this.wordListService.getBySymbolAndLocation(symbol, location)
            .then(results => {
                console.log(results);
                return results;
            });
        ;
    }


}

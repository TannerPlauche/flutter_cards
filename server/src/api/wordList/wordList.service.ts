import {Injectable} from '@nestjs/common';
import {BaseService} from "../baseService";
import {WordList} from "../../models/wordList.model";
import {InjectModel} from "@nestjs/mongoose";
import {Model} from "mongoose";

@Injectable()
export class WordListService extends BaseService<WordList> {

    constructor(@InjectModel(WordList.name) private wordListModel: Model<WordList>) {
        super(wordListModel);
    }

    async getBySymbolAndLocation(symbol: string, location: string): Promise<WordList> {
        const query = {
            symbol, location
        };

        return this.wordListModel.findOne(query);
    }

}

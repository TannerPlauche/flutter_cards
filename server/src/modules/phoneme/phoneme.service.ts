import {Injectable} from '@nestjs/common';
import {IPhoneme} from "./interfaces";
import {Phoneme} from "../../models/phoneme.model";
import {InjectModel} from "@nestjs/mongoose";
import {Model} from "mongoose";

@Injectable()
export class PhonemeService {

    constructor(@InjectModel(Phoneme.name) private phonemeModel: Model<Phoneme>) {
    }

    getPhonemes(): string {
        return '/a/';
    }

    async getPhonemeBySymbol(symbol: string): Promise<Phoneme> {
        console.log(symbol);
        return await this.phonemeModel.findOne({symbol: symbol});
    }

    async createPhoneme(phoneme: Phoneme): Promise<Phoneme> {
        const newPhoneme = new this.phonemeModel(phoneme);
        return newPhoneme.save()
            .catch(err => err);
    }
}

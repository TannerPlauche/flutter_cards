import {Injectable} from '@nestjs/common';
import {Phoneme} from "../../models/phoneme.model";
import {InjectModel} from "@nestjs/mongoose";
import {Model} from "mongoose";

@Injectable()
export class PhonemeService {

    constructor(@InjectModel(Phoneme.name) private phonemeModel: Model<Phoneme>) {
    }

    getPhonemes(): Promise<Phoneme[]> {
        return new Promise<Phoneme[]>((resolve, reject) => {
            this.phonemeModel.find({}, (err, results) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(results);
                }
            });
        })
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

    async updateSymbol(phoneme: Phoneme): Promise<boolean> {
        return this.phonemeModel.updateOne({symbol: phoneme.symbol}, phoneme)
            .catch(err => err);

    }
}

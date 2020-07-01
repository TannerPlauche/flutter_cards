import {Prop, Schema, SchemaFactory} from '@nestjs/mongoose';
import {Document} from 'mongoose';
import {WordCard, WordCardSchema} from "./wordCard.model";

@Schema()
export class WordList extends Document {
    @Prop({required: true})
    symbol: string;

    @Prop({required: true})
    location: string;

    @Prop({
        default: []
    })
    wordList: [WordCard];

}

export const WordListSchema = SchemaFactory.createForClass(WordList);
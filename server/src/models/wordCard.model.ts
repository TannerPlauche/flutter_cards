import {Prop, Schema, SchemaFactory} from '@nestjs/mongoose';
import {Document} from 'mongoose';

@Schema()
export class WordCard extends Document {
    @Prop()
    word: string;

    @Prop()
    imageUrl: string;

}

export const WordCardSchema = SchemaFactory.createForClass(WordCard);
import {Prop, Schema, SchemaFactory} from '@nestjs/mongoose';
import {Document} from 'mongoose';

@Schema()
export class Phoneme extends Document {
    @Prop()
    symbol: string;

    @Prop()
    letter: string;
}

export const PhonemeSchema = SchemaFactory.createForClass(Phoneme);
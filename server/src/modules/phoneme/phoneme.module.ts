import {Module} from '@nestjs/common';
import {PhonemeController} from './phoneme.controller';
import {PhonemeService} from './phoneme.service';
import {MongooseModule} from "@nestjs/mongoose";
import {Phoneme, PhonemeSchema} from "../../models/phoneme.model";

@Module({
    imports: [MongooseModule.forFeature([{name: Phoneme.name, schema: PhonemeSchema}])],
    controllers: [PhonemeController],
    providers: [PhonemeService]
})
export class PhonemeModule {
}

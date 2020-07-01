// FRAMEWORK IMPORTS
import {Module} from '@nestjs/common';
import {DB_CONNECTION} from "./dbConnection";
import {MongooseModule} from '@nestjs/mongoose';

// MODEL IMPORTS
import {Phoneme, PhonemeSchema} from "./models/phoneme.model";
import {WordList, WordListSchema} from "./models/wordList.model";

// API IMPORTS
import {AppController} from './api/app/app.controller';
import {AppService} from './api/app/app.service';
import {PhonemeController} from "./api/phoneme/phoneme.controller";
import {PhonemeService} from "./api/phoneme/phoneme.service";
import {WordListController} from "./api/wordList/word-list.controller";
import {WordListService} from "./api/wordList/wordList.service";

@Module({
    imports: [
        MongooseModule.forRoot(DB_CONNECTION),
        MongooseModule.forFeature([
            {name: Phoneme.name, schema: PhonemeSchema},
            {name: WordList.name, schema: WordListSchema}
        ])
    ],
    controllers: [
        AppController,
        PhonemeController,
        WordListController
    ],
    providers: [
        AppService,
        PhonemeService,
        WordListService
    ],
})

export class AppModule {
}

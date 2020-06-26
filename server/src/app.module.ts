// FRAMEWORK IMPORTS
import {Module} from '@nestjs/common';
import {MongooseModule} from '@nestjs/mongoose';

// MODEL IMPORTS
import {Phoneme, PhonemeSchema} from "./models/phoneme.model";

// API IMPORTS
import {AppController} from './api/app/app.controller';
import {AppService} from './api/app/app.service';
import {PhonemeController} from "./api/phoneme/phoneme.controller";
import {PhonemeService} from "./api/phoneme/phoneme.service";

@Module({
    imports: [
        MongooseModule.forRoot('mongodb://test:test123@ds253418.mlab.com:53418/zounds'),
        MongooseModule.forFeature([{name: Phoneme.name, schema: PhonemeSchema}])],
    controllers:
        [AppController, PhonemeController],
    providers:
        [AppService, PhonemeService],
})

export class AppModule {
}

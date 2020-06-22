import {Module} from '@nestjs/common';
import {MongooseModule} from '@nestjs/mongoose';

import {AppController} from './app.controller';
import {AppService} from './app.service';
import {PhonemeModule} from "./modules/phoneme/phoneme.module";

@Module({
    imports:
    [MongooseModule.forRoot('mongodb://test:test123@ds253418.mlab.com:53418/zounds'), PhonemeModule],
    controllers:
        [AppController],
    providers:
        [AppService],
})

export class AppModule {
}

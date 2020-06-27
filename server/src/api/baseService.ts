import {Injectable} from "@nestjs/common";
import {Model} from "mongoose";


@Injectable()
export class BaseService<T> {

    constructor(private dbModel: Model<any>) {
    }

    getAll(): Promise<T[]> {
        return new Promise<T[]>((resolve, reject) => {
            this.dbModel.find({}, (err, results) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(results);
                }
            });
        })
    }

    async create(data: T): Promise<T> {
        const newRecord = new this.dbModel(data);
        return newRecord.save()
            .catch(err => err);
    }
}
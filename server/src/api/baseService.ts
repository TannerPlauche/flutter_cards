import {Injectable} from "@nestjs/common";
import {Model, Schema} from "mongoose";

const ObjectId = Schema.Types.ObjectId;

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

    getById<T>(id: string): Promise<T> {
        return new Promise<T>((resolve, reject) => {
            this.dbModel.findById(id, (err, result) => {
                if (err) {
                    return reject(err);
                }

                resolve(result);
            });
        })
    }

    async create(data: T): Promise<T> {
        const newRecord = new this.dbModel(data);
        return newRecord.save()
            .catch(err => err);
    }

    async updateById(id: string, data: T): Promise<T> {
        console.log(id, data);
        return this.dbModel.findByIdAndUpdate(id, data);
    }
}
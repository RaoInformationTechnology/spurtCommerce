import { ObjectType } from 'typeorm';
import { FactoryFunction } from './types';
export declare class EntityFactory<Entity, Settings> {
    name: string;
    entity: ObjectType<Entity>;
    private factory;
    private settings?;
    private mapFunction;
    constructor(name: string, entity: ObjectType<Entity>, factory: FactoryFunction<Entity, Settings>, settings?: Settings);
    /**
     * This function is used to alter the generated values of entity, before it
     * is persist into the database
     */
    map(mapFunction: (entity: Entity) => Promise<Entity>): EntityFactory<Entity, Settings>;
    /**
     * Make a new entity, but does not persist it
     */
    make(): Promise<Entity>;
    /**
     * Seed makes a new entity and does persist it
     */
    seed(): Promise<Entity>;
    makeMany(amount: number): Promise<Entity[]>;
    seedMany(amount: number): Promise<Entity[]>;
    private resolveEntity;
}

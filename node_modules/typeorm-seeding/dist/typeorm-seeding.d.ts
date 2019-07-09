import 'reflect-metadata';
import { Connection, ObjectType } from 'typeorm';
import { Factory, FactoryFunction, SeedConstructor } from './types';
export * from './importer';
export * from './connection';
export { Factory, Seed } from './types';
export { times } from './utils';
/**
 * Adds the typorm connection to the seed options
 */
export declare const setConnection: (connection: Connection) => Connection;
/**
 * Returns the typorm connection from our seed options
 */
export declare const getConnection: () => any;
/**
 * Defines a new entity factory
 */
export declare const define: <Entity, Settings>(entity: ObjectType<Entity>, factoryFn: FactoryFunction<Entity, Settings>) => void;
/**
 * Gets a defined entity factory and pass the settigns along to the entity factory function
 */
export declare const factory: Factory;
/**
 * Runs a seed class
 */
export declare const runSeed: <T>(seederConstructor: SeedConstructor) => Promise<T>;

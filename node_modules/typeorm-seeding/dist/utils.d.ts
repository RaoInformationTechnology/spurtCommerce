/**
 * Returns the name of a class
 */
export declare const getNameOfClass: (c: any) => string;
/**
 * Checks if the given argument is a promise
 */
export declare const isPromiseLike: (o: any) => boolean;
/**
 * Times repeats a function n times
 */
export declare const times: <TResult>(n: number, iteratee: (index: number) => Promise<TResult>) => Promise<TResult[]>;

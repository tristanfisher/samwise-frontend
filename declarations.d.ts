import { Message, PlainMessage } from '@bufbuild/protobuf';

declare global {
  type Maybe<T> = T | undefined;
  type Nullish<T> = T | null; // for json
}

export {}; // Ensure this file is treated as a module

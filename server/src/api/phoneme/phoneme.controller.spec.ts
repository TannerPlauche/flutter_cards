import { Test, TestingModule } from '@nestjs/testing';
import { PhonemeController } from './phoneme.controller';

describe('Phoneme Controller', () => {
  let controller: PhonemeController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PhonemeController],
    }).compile();

    controller = module.get<PhonemeController>(PhonemeController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});

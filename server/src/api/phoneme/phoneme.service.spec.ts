import { Test, TestingModule } from '@nestjs/testing';
import { PhonemeService } from './phoneme.service';

describe('PhonemeService', () => {
  let service: PhonemeService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PhonemeService],
    }).compile();

    service = module.get<PhonemeService>(PhonemeService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});

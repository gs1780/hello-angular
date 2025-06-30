import { Component, OnInit, inject } from '@angular/core';
import { HelloService } from './hello.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [],
  template: `<h1>{{ message }}</h1>`
})
export class AppComponent implements OnInit {
  message = '';
  private helloService = inject(HelloService);

  ngOnInit(): void {
    this.helloService.getHello().subscribe(m => this.message = m);
  }
}

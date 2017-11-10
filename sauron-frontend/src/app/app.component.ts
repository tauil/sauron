import { Component } from '@angular/core';
import { Http, Response, Headers } from '@angular/http';
import { NgForm } from '@angular/forms';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  tweets = [];
  loading: boolean = false;

  constructor(private http:Http) {
  }

  search(form: NgForm) {
    this.loading = true;
    event.preventDefault();

    let searchTerm = form["search_term"].value;

    let headers = new Headers();
    headers.append('Content-Type', 'application/json');

    this.http.get('http://localhost:4567/search?search_term=' + searchTerm, { headers: headers }).subscribe(
      response => {
        this.loading = false;
        let body = JSON.parse(response["_body"]);
        this.tweets = body;
      }
    );
  }
}

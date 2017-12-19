import React from 'react';
import ReactDOM from 'react-dom';
import { Collapse } from 'reactstrap';
import axios from "axios";
import Thread from "./thread";

class ThreadList extends React.Component {
  constructor(props) {
    super(props)
  
    this.toggle = this.toggle.bind(this)
        
    this.state = { 
      threads: [],
      newThread: "",      
      isLoading: false,
      isLoaded: false,
      collapse: false
    } 
  } 

  toggle() {
    this.setState({ collapse: !this.state.collapse })
  }

  // Load comments when state changes
  componentWillUpdate(nextProps, nextState) {
    if (nextState.collapse && !nextState.isLoading && !nextState.isLoaded) {
      this.fetchThreads()
    }
  }

  onKeyDownHandler(event) {
     // enter key has keyCode = 13
     if (event.keyCode == 13) {    
      this.postThread();
      return false
    }  
  }

  postThread() {    
    let CSRF_TOKEN = $('meta[name=csrf-token]').attr('content');
    const { resourceUrl } = this.props;
    
    let params = {
      authenticity_token: CSRF_TOKEN,
      body: this.state.newThread
    }

    axios.post(resourceUrl, params)
      .then((response) => {
        // Add the new thread to the top of the collection
        this.setState((state) => ({ threads: [response.data].concat(state.threads) }))
      }) 
  }

  fetchThreads() {
    const { resourceUrl } = this.props;
    this.setState({isLoading: true})

    axios.get(resourceUrl)
      .then((response) => { 
        this.setState({isLoaded: true, isLoading: false, threads: response.data.comments})       
      })
  }

  render() {
    const { imageSize } = this.props;
    const { threads } = this.state;
    let threadCount = threads.length;

    if (threads.length == 0 && this.props.threadCount) 
      threadCount = this.props.threadCount;

    let list;

    if (this.state.isLoading) {
      list = <div>Loading...</div>
    } else { 
      list = threads.map(thread => <Thread key={thread.id} imageSize={imageSize} data={thread} />) 
    }

    return(      
      <div>
        <a href="#threadList" onClick={this.toggle} className="btn btn-outline-primary mb-1" data-toggle="collapse" aria-expanded="false" aria-controls="threadList"><i className="fa fa-comments" aria-hidden="true"></i> Comments ({threadCount})</a>
        
        <Collapse id="threadList" isOpen={this.state.collapse}>
          <textarea 
            onChange={event =>{ this.setState({newThread: event.target.value}) }} 
            onKeyDown={event => { this.onKeyDownHandler(event) }}
            className="form-control" cols="10" rows="5" name="comment[body]">
          </textarea>

          { list }
        </Collapse>
      </div>
    )  
  }
}

export default ThreadList;